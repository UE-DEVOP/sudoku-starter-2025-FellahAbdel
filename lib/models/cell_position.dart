class CellPosition {
  final int block;
  final int cell;

  const CellPosition(this.block, this.cell);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CellPosition &&
              runtimeType == other.runtimeType &&
              block == other.block &&
              cell == other.cell;

  @override
  int get hashCode => block.hashCode ^ cell.hashCode;
}
